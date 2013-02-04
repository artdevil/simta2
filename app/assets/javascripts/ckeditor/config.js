CKEDITOR.editorConfig = function( config )
{
  config.toolbar = 'Mini';

  config.toolbar_Mini =
    [
        ['Cut','Copy','Paste',], ['Undo','Redo'],
        [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ], ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
        [ 'Font','FontSize' ], ['JustifyLeft','JustifyCenter','JustifyRight'],[ 'Link','Unlink','Anchor' ]
    ];
}