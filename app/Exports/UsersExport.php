<?php

namespace App\Exports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class UsersExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
{
    private $rowCount;

    public function __construct()
    {
        $this->rowCount = 0;
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return User::with(['roles'])->get();
    }

    public function map($user): array
    {
        $this->rowCount++;

        $row = [
            $this->rowCount,
            $user->name,
            $user->email,
            $user->phone
        ];

        if (!isset($user->roles)) {
            return $row;
        }

        $row[] = implode(",",  $user->roles->map(function ($role) {
            return $role["name"];
        })->toArray());

        return $row;
    }

    public function headings(): array
    {
        return [
            "ល.រ",
            "ឈ្មោះ",
            "សារអេឡិចត្រូនិច",
            "លេខទូរស័ព្ទ",
            "តួនាទី"
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 15,
            'B' => 45,
            'C' => 35,
            'D' => 30,
            'E' => 25
        ];
    }
}
