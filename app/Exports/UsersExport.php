<?php

namespace App\Exports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\Font;
use Maatwebsite\Excel\Concerns\Alignment;
use Maatwebsite\Excel\Events\AfterSheet;

class UsersExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths, ShouldAutoSize, WithEvents
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

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $cellRange = 'A1:W1'; // All headers
                // $event->sheet->getDelegate()->getStyle($cellRange)->getFont()->setSize(14);
            },
        ];
    }
}
