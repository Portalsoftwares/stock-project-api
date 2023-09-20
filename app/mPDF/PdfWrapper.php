<?php

namespace App\mPDF;

use File;
use View;

class PdfWrapper
{

    /**
     * Load a HTML string
     *
     * @param string $html
     * @return Pdf
     */
    public static function loadHTML($html, $config = [])
    {
        return new Pdf(config('pdf.template_path') . '.' . $html, $config);
    }

    /**
     * Load a HTML file
     *
     * @param string $file
     * @return Pdf
     */
    public static function loadFile($file, $config = [])
    {
        return new Pdf(File::get($file), $config);
    }

    /**
     * Load a View and convert to HTML
     *
     * @param string $view
     * @param array $data
     * @param array $mergeData
     * @return Pdf
     */
    public static function loadView($view, $data = [], $mergeData = [], $config = [])
    {
        return new Pdf(View::make(config('pdf.template_path') . '.' . $view, $data, $mergeData)->render(), $config);
    }
}
