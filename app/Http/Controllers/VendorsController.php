<?php

namespace App\Http\Controllers;

use App\Models\Vendors;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules;
use Illuminate\Support\Facades\Validator;

class VendorsController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items =  Vendors::query();
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'id';
        if ($per_page == -1) {
            $per_page = DB::table('Vendors')->count() > 0 ? DB::table('Vendors')->count() : $per_page;
        }
        $items =  Vendors::where(function ($query) use ($request) {
            if (!empty($request->search)) {
                $query->orWhere('name', 'like', "%" . $request->search . "%");
            }
        });

        $data = $items
            ->orderBy($sort_by, $order_by)
            ->paginate($per_page);

        $response = [
            'data' => $data,
        ];
        return  response($response, 200);

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'unique:products'],
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 201);
        }

        $items = Vendors::create([
            'name' => $request->name,
            'phone_number' => $request->phone_number,
            'image' => $request->image
        ]);

        $response = [
            'message' => "Items created."
        ];
        return  response($response, 201);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\products  $products
     * @return \Illuminate\Http\Response
     */
    public function show(products $products)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\products  $products
     * @return \Illuminate\Http\Response
     */
    public function edit(Vendors $products, $id)
    {
        $items = Vendors::where('id', $id)->first();
        if (is_null($items)) {
            $response = [
                'message' => 'user not found',
            ];
            return  response($response, 404);
        }
        $response = [
            'data' => $items,
        ];
        return  response($response, 201);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\products  $products
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string'],
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 201);
        }

        $items = Vendors::where('id', $id)->update([
            'name' => $request->name,
            'phone_number' => $request->phone_number,
            'image' => $request->image
        ]);

        $response = [
            'message' => "Items updated."
        ];
        return  response($response, 201);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\products  $products
     * @return \Illuminate\Http\Response
     */
    public function destroy(Vendors $Vendors, $id )
    {
        //
        Vendors::where('id', $id)->delete();

        $response = [
            'message' => "Items delete."
        ];
        return  response($response, 201);
    }
}
