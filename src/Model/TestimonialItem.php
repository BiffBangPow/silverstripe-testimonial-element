<?php

namespace BiffBangPow\Element\Model;

use BiffBangPow\Element\TestimonialsElement;
use BiffBangPow\Extension\SortableExtension;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;

/**
 * Class \BiffBangPow\Element\Model\TestimonialItem
 *
 * @property int $Sort
 * @property string $Quote
 * @property string $AttributionName
 * @property string $AttributionTitle
 * @property int $ElementID
 * @property int $ImageID
 * @method \BiffBangPow\Element\TestimonialsElement Element()
 * @method \SilverStripe\Assets\Image Image()
 * @mixin \BiffBangPow\Extension\SortableExtension
 */
class TestimonialItem extends DataObject
{
    private static $table_name = 'BBP_TestimonialsElementItem';
    private static $has_one = [
        'Element' => TestimonialsElement::class,
        'Image' => Image::class
    ];
    private static $owns = [
        'Image'
    ];
    private static $extensions = [
        SortableExtension::class
    ];
    private static $db = [
        'Quote' => 'Text',
        'AttributionName' => 'Varchar',
        'AttributionTitle' => 'Varchar'
    ];
    private static $summary_fields = [
        'Image.CMSThumbnail' => 'Image',
        'AttributionName' => 'Attribution',
        'Quote.LimitWordCount' => 'Quote'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->removeByName(['ElementID']);
        return $fields;
    }
}
