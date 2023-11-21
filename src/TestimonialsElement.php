<?php

namespace BiffBangPow\Element;

use BiffBangPow\Element\Control\TestimonialsElementController;
use BiffBangPow\Element\Model\TestimonialItem;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;

/**
 * Class \BiffBangPow\Element\TestimonialsElement
 *
 * @method \SilverStripe\ORM\DataList|\BiffBangPow\Element\Model\TestimonialItem[] Testimonials()
 */
class TestimonialsElement extends BaseElement
{
    private static $table_name = 'BBP_TestimonialsElement';
    private static $inline_editable = false;

    private static $has_many = [
        'Testimonials' => TestimonialItem::class
    ];

    private static $controller_class = TestimonialsElementController::class;

    private static $include_default_js = true;

    private static $include_default_css = true;

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->removeByName(['Testimonials']);
        $fields->addFieldsToTab('Root.Main', [
           GridField::create(
               'Testimonials',
               _t(__CLASS__.'.Testimonials', 'Testimonials'),
               $this->Testimonials(),
               GridFieldConfig_RecordEditor::create()->addComponent(GridFieldOrderableRows::create())
           )
        ]);
        return $fields;
    }

    /**
     * @return string
     */
    public function getType()
    {
        return 'Testimonials';
    }

    /**
     * @return string
     */
    public function getSimpleClassName()
    {
        return 'bbp-testimonials-element';
    }
}
