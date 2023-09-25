<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use Illuminate\Http\Request;


class SettingController extends Controller
{
    public function index(Request $request)
    {
        $items = Setting::first();
        return response()->json(['data' => $items]);
    }
    public function update(Request $request)
    {
        $items = Setting::first();
        if (!empty($items)) {
            $items->name = $request->name;
            $items->email = $request->email;
            $items->phone = $request->phone;
            $items->logo = $request->logo;
            $items->address = $request->address;
            $items->backup_type = $request->backup_type;
            $items->backup_time = $request->backup_time;
            $items->save();
        }
        $response = [
            'data' => 'Update successfull',
        ];
        return  response($response, 200);
    }
}
