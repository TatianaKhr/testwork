<?php namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;

use Closure;

use Illuminate\Contracts\Auth\Guard;

use App;
use Lang;

// extends Middleware

class AppAuthenticate{

	/**
	 * The Guard implementation.
	 *
	 * @var Guard
	 */
	protected $auth;

	/**
	 * Create a new filter instance.
	 *
	 * @param  Guard  $auth
	 * @return void
	 */
	public function __construct(Guard $auth)
	{
		$this->auth = $auth;
	}

	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */
	public function handle($request, Closure $next)
	{
	
		// HTTPS only on production
		if (!$request->secure() && App::environment() === 'production') {

			return redirect()->secure($request->getRequestUri());
		}

		if ($this->auth->guest()){

			if($request->ajax()) {

				return response('Unauthorized.', 401);

			}else{

				return redirect()->guest('auth/login');
			}

		}else{

			$userHasAccess = false;

			$user = $this->auth->user();

			if($user->isRoot() || $user->isSuperAdmin()){
				
				return $next($request);
			}
			
			$action = $request->route()->getAction();
			$controller = class_basename($action['controller']);
			list($controller, $action) = explode('@', $controller);

			if($userHasAccess === true){

				return $next($request);

			}else{

				if ($request->ajax())
				{
					return response('Unauthorized.', 401);

				}else
				{					
					$errorMessage = Lang::get('shared.access_denied');
					
					if($controller == 'DashboardController' && $action == 'index'){
						
						return $next($request);

					}else{

						return redirect()->route('dashboard.access_denied')->withErrors([$errorMessage]);
					}
				}
			}	
		}
	}
}
