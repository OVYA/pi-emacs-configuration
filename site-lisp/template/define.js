/**
 * Description courte du module (obligatoire)
 *
 * Description plus longue du module (conseillé)
 */
define([
  "module",
  "dojo/_base/declare",
  "dojo/_base/lang"
], function(module, declare, lang) {

return declare([_Widget], { //--noindent--

  someMethod: function() {

  },

  /**
   * The Class name comes from module's -- used by declare()
   */
  declaredClass: module.id

});

});
