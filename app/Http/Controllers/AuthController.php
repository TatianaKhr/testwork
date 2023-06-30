<?php namespace App\Http\Controllers;

use Illuminate\Contracts\Auth\Guard;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login()
    {
        return view('auth.login');
    }

    public function logout(Guard $auth)
	{
		$auth->logout();

		return redirect(property_exists($this, 'redirectAfterLogout') ? $this->redirectAfterLogout : '/auth/login');
	}

    public function authenticate(Request $request,Guard $auth)
	{

		$this->validate($request, [
			'login' => 'required|email',
			'password' => 'required',
		]);

		$credentials = [
			'email' => $request->input('login'),
			'password' => $request->input('password'),
		];


		if ($auth->attempt($credentials, $request->has('remember'))){

            $request->session()->regenerate();

			return redirect()->intended($this->redirectPath());
		}

		return redirect($this->loginPath())
					->withInput($request->only('email', 'remember'))
					->withErrors([
						'email' => $this->getFailedLoginMessage(),
					]);
    }

    /**
	 * Get the failed login message.
	 *
	 * @return string
	 */
	protected function getFailedLoginMessage()
	{
		return 'These credentials do not match our records.';
    }

    /**
	 * Get the post register / login redirect path.
	 *
	 * @return string
	 */
	public function redirectPath()
	{
		if (property_exists($this, 'redirectPath'))
		{
			return $this->redirectPath;
		}

		return property_exists($this, 'redirectTo') ? $this->redirectTo : '/';
	}

	/**
	 * Get the path to the login route.
	 *
	 * @return string
	 */
	public function loginPath()
	{
		return property_exists($this, 'loginPath') ? $this->loginPath : '/auth/login';
	}

//    /**
//     * Get the path to the login route.
//     *
//     * @return string
//     */
//    public function loginPath()
//    {
//        return property_exists($this, 'loginPath') ? $this->loginPath : '/auth/login';
//    }

}
