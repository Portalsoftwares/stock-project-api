<?php

namespace App\Exports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class UsersExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths, ShouldAutoSize
{
    private $row_count;
    private $is_show_trust;

    public function __construct(bool $is_show_trust = false)
    {
        $this->is_show_trust = $is_show_trust;
        $this->row_count = 0;
    }

    /**
     * Get the collection of users to export.
     *
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        if ($this->is_show_trust) {
            return User::onlyTrashed()->with(['roles'])->get();
        }
        return User::with(['roles'])->get();
    }

    /**
     * Map the user data to an array.
     *
     * @param  mixed  $user
     * @return array
     */
    public function map($user): array
    {
        $this->row_count++;
        $row = [
            $this->row_count,
            $user->name,
            $user->email,
            $user->phone
        ];

        if (!isset($user->roles)) {
            return $row;
        }

        $row[] = implode(",", $user->roles->map(function ($role) {
            return $role["name"];
        })->toArray());

        return $row;
    }

    /**
     * Get the headings for the exported file.
     *
     * @return array
     */
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

    /**
     * Get the column widths for the exported file.
     *
     * @return array
     */
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