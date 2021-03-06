$(function() {

    $('.track-label').click(function() {

        if (!$(this).hasClass('on')) {
            
            $('.track-label').removeClass('on');
            $(this).addClass('on');
            
            $('#track-panel').children().empty();
            $('#track-info').append($(this).next().clone().children()).show();
            $('#track-edit').hide();
            
            var t = new Track($(this).data('import-track-id'));
            t.show({
                complete: function() {
                    $('#track-edit').fadeIn();
                }
            });
        } 
    });

    $('.track-body')
            .hide()
            .find('.val.purchase-url:has(a[href=""])')
            .each(function() {
                $this = $(this);
                $this.prev().hide();
                $this.hide();
            });

    $('.track-label')
            .each(TrackList.updateIcons)
            .mouseover(function() { $(this).addClass('over'); })
            .mouseout(function() { $(this).removeClass('over'); })
            .first()
            .click();

    // display track-list after all js loaded
    $('#track-list,#track-list-nav').css('opacity', 1);
});

var TrackList = {};

TrackList.updateIcons = function(index, label) {

    $label = (label instanceof $) ? label : $(label);
    $label.toggleClass('hasOrders', $label.data('count-orders') > 0);
    $label.toggleClass('isExclusive', $label.data('exclusive') == 2);

};

TrackList.updateMore = function(label) {

    $label = (label instanceof $) ? label : $(label);
    $('#track-info .track-more')
        .replaceWith($label.next().children().first().clone().show());
};