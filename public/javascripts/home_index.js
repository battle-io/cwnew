//// GET SOME MORE!
//

( function( window , _ , $ ){

  var BIO = window.BIO || BIO || {};

  BIO.index = BIO.index || {};

  _.extend( BIO.index , {

    init: function(){

      $( ".loginbutton" ).bind( 'click' , function( e ){
        window.location.href = "/login";
      } );

    }

  } );

  window.BIO = BIO;
  $( BIO.index.init );

} )( window , _ , jQuery );


