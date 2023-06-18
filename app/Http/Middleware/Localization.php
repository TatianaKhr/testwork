<?php
namespace App\Http\Middleware;
use Closure;

class Localization
{
  /**
  * Handle an incoming request.
  *
  * @param \Illuminate\Http\Request $request
  * @param \Closure $next
  * @return mixed
  */
  public function handle($request, Closure $next)
  {
    $user = $request->user();

     // Check header request and determine localizaton
     //$locale = ($request->hasHeader('X-localization')) ? $request->header('X-localization') : 'en';

     $locale = !empty($user->interface_language) ? $user->interface_language : null;

     // set laravel localization
     app()->setLocale($locale);

    // continue request
    return $next($request);
  }
}