<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

abstract class AbstractExport implements WithStyles
{

    public function styles(Worksheet $sheet)
    {
        $sheet->getStyle('A1:Z100')->getFont()->applyFromArray([
            'name' => 'Khmer OS Siemreap',
            'size' => 10,
            'color' => [
                'rgb' => '000'
            ]
        ]);
    }
}
