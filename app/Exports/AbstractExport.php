<?php

namespace App\Exports;

use Maatwebsite\Excel\Events\AfterSheet;
use Maatwebsite\Excel\Concerns\WithEvents;

abstract class AbstractExport implements WithEvents
{
    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $event->sheet->getDelegate()->getStyle('A1:W1')->getFont()->applyFromArray([
                    'name' => 'Khmer OS Siemreap',
                    'size' => 10,
                    'bold' => true,
                    'italic' => false,
                    'underline' => \PhpOffice\PhpSpreadsheet\Style\Font::UNDERLINE_DOUBLE,
                    'strikethrough' => false,
                    'color' => [
                        'rgb' => '808080'
                    ]
                ]);
            },
        ];
    }
}