<?php

namespace App\Exports;

use App\Models\Teacher;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;

class ReportScoreExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
{
    private $rowCount;
    public  $data = [];
    public  $option = [];

    public function __construct($data1, $data2)
    {
        // dd($data['data']);
        $this->data = $data1['data'];
        $this->option = $data2;
    }

    public function collection()
    {
        return collect($this->data);
    }

    public function map($data): array
    {

        $this->rowCount++;

        $row = [
            $this->rowCount,
            $data['student_name'],
            $data['mark_avg'],
            $data['mark_rank'],
        ];
        return $row;
    }

    public function headings(): array
    {
        return [
            "ល.រ",
            "គោត្តនាម និងនាម",
            "មធ្យមភាគ",
            "ចំណាត់ថ្នាក់",
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 15,
            'B' => 45,
            'C' => 35,
            'D' => 30
        ];
    }
}
