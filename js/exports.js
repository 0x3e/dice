exports={}
exports.load=function(url, callback)
{
  var head = document.getElementsByTagName('head')[0];
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = url;
  script.onreadystatechange = callback;
  script.onload = callback;
  head.appendChild(script);
}
exports.get=function(mod){return exports[mod]}
module={}
require=function(a){return exports}
