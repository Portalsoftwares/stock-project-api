<?php

namespace App\Exports;

use App\Models\ScoreType;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use Carbon\Carbon;

class ExamExport extends AbstractExport implements FromCollection, WithHeadings, WithMapping, WithColumnWidths
{
    private $row_count;
    private $is_show_trust;

    public function __construct($is_show_trust = false)
    {
        $this->is_show_trust = $is_show_trust;
        $this->row_count = 0;
    }

    // Returns collection of subject
    public function collection()
    {
        if ($this->is_show_trust) {
            return ScoreType::onlyTrashed()->whereNotIn('type', [3, 4])->get();
        }
        return ScoreType::whereNotIn('type', [3, 4])->get();
    }

    public function map($exam): array
    {
        $this->row_count++;

        $row = [
            $this->row_count,
            $exam->name,
            $exam->date!='0000-00-00'? Carbon::parse($exam->date)->format('m-d'):'មិនកំណត់',
        ];
        return $row;
    }
    
    public function headings(): array
    {
        return [
            "ល.រ",
            "ឈ្មោះ",
            "កាលបរិច្ឆេទ"
        ];
    }

    public function columnWidths(): array
    {
        return [
            'A' => 5,
            'B' => 25,
            'C' => 15,

        ];
    }
}
