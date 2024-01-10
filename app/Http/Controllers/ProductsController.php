<?php

namespace App\Http\Controllers;

use App\Models\Products;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules;
use Illuminate\Support\Facades\Validator;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $items =  Products::query();
        $per_page = $request->per_page ?? 10;
        $order_by = $request->order_by == -1 ? 'DESC' : 'ASC';
        $sort_by = $request->sort_by ?: 'id';
        if ($per_page == -1) {
            $per_page = DB::table('products')->count() > 0 ? DB::table('products')->count() : $per_page;
        }
        $items =  Products::where(function ($query) use ($request) {
            if (!empty($request->search)) {
                $query->orWhere('code', 'like', "%" . $request->search . "%");
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
            'code' => ['required', 'string', 'unique:products'],
            'name' => ['required', 'string', 'unique:products'],
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 201);
        }

        $items = Products::create([
            'code' => $request->code,
            'name' => $request->name,
            'description' => $request->description,
            'cost' => $request->cost,
            'category_ref_id' => $request->category_ref_id,
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
    public function edit(products $products, $id)
    {
        $items = Products::where('id', $id)->first();
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
            'code' => ['required', 'string'],
            'name' => ['required', 'string'],
        ]);

        if ($validator->fails()) {
            $response = [
                'errors' => $validator->messages(),
            ];
            return  response($response, 201);
        }

        $items = Products::where('id', $id)->update([
            'code' => $request->code,
            'name' => $request->name,
            'description' => $request->description,
            'cost' => $request->cost,
            'category_ref_id' => $request->category_ref_id,
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
    public function destroy(products $products, $id )
    {
        //
        Products::where('id', $id)->delete();

        $response = [
            'message' => "Items delete."
        ];
        return  response($response, 201);
    }
}
