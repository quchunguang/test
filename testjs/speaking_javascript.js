p = console.log;

var jane = {};
jane.name = "Jane";
jane.friends = ["qcg", "ynn", "qq"];
jane.logFriends = function() {
    'use strict';
    this.friends.forEach(function(friend) {
        p(friend);
    });
};
jane.logFriends();
p(jane);

function C() {}
var o2 = new C();
if (o2 instanceof Object) {
    p('o2 is an Object');
}

p(typeof new C());
p(typeof Boolean(false));
p(typeof new Boolean(false));

p(parseFloat('123.456'));
if (isNaN('123d')) {
    p('is not a number');
}
p([1, 2] + [3]); //!!! return string "1,23"
p([1, 2].concat([3]));
p(Number.MAX_VALUE);
p(1234..toPrecision(3));
p((1234).toPrecision(3));

var s = 'abc';
for (var i = 0; i < s.length; i++) {
    p(s.charCodeAt(i));
}
var l = s.split('').map(function(elem) {
    return elem.charCodeAt(0);
});
p(l);

p('1,2, 3 , 4'.split(','));
p('1,2, 3 , 4'.split(/, */));
p('1,2, 3 , 4'.split(/ *, */));
p('1,2, 3 , 4'.split(/ *(,) */));
p('iixxxixx'.replace(/i/g, 'o'));
p('iixxxixx'.replace(/(i+)/g, '[$1]'));

var doNTimes = function(n, action) {
    function doNTimesRec(x) {
        if (x > 0) {
            action();
            doNTimesRec(x - 1);
        }
    }
    doNTimesRec(n);
}(3, function() {
    p('x');
});

var l = [1, 2, 3];
for (i in l) {
    p(i);
}

var logArgs = function() {
    Array.prototype.forEach.call(arguments, function(elem, i) {
        p(i + '. ' + elem);
    });
}('foo', 'bar');

p(/abc/i.test('ABC'));
p(new RegExp('abc', 'i').test('ABC'));

var reg = /a(b+)/g;
var match;
while (match = reg.exec('_abbb_ab_')) {
    p(match[1]);
}

p(new Date(0), new Date());
p(new Date(Date.parse('2010-01-02')).toISOString());

p(Math.max(1,2,3));

var obj = {};
obj.name = "Kevin";
obj.score = [1,2,3];
p(JSON.stringify(obj));
function replacer(key, value) {
    if (typeof value === 'number'){
        value *= 2;
    }
    return value;
}
s = JSON.stringify(obj, replacer, 4);

var obj2 = JSON.parse(s);
p(obj2);
