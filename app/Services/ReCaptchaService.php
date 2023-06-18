<?php namespace App\Services;

use Illuminate\Http\Request;
use ReCaptcha\ReCaptcha;

class ReCaptchaService {

    public function check(Request $request)
    {
        $response = $request->get('g-recaptcha-response');
        $remoteIP = $_SERVER['REMOTE_ADDR'];

        $secret = env('RECAPTCHA_SECRET');

        $recaptcha = new ReCaptcha($secret);

        $reCaptchaResponse = $recaptcha->verify($response, $remoteIP);

        if ($reCaptchaResponse->isSuccess()) {

            return true;

        }

        return false;
    }

}