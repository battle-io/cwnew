//// GET SOME MORE!
//

( function( window , _ , $ ){

  var BIO = window.BIO || BIO || {};

  BIO.bot = BIO.bot || {};

  _.extend( BIO.bot , {

    init: function(){
      BIO.bot.initializeJqueryFormToObjectPlugin();
      BIO.bot.bindEvents();
    },

    bindEvents: function(){

      // click event on our thumbs up
      $( "#bot-thumb-up" ).bind( 'click' , function( e ){
        e.preventDefault();
        var form_data = $("#new_like").serializeObject();
        $.post( "/likes" , form_data , function( response ){
          $( "#bot-thumb-up-tick" ).show();
          $( "#bot-thumb-up-tick" ).fadeOut( 3000 );
        } );
      } );

    },

    initializeJqueryFormToObjectPlugin: function(){
      $.fn.serializeObject = function(){
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
      };
    }

  } );

  window.BIO = BIO;
  $( BIO.bot.init );

} )( window , _ , jQuery );

