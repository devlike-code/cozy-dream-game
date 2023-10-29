
day_strings = [
	"SUN",
	"MON",
	"TUE",
	"WED",
	"THU",
	"FRI",
	"SAT"
];

day = 1;
hour = 7;

alarm_set(0, hour_length * room_speed);

hour_colors = [
	{ r: 0, g: 0, b: 0, a: 0.4 }, // 00:00
	{ r: 0, g: 0, b: 0, a: 0.5 }, // 1am
	{ r: 0, g: 0, b: 0, a: 0.5 }, // 2am
	{ r: 0, g: 0, b: 0, a: 0.5 }, // 3am
	{ r: 0, g: 0, b: 0, a: 0.4 }, // 4am
	{ r: 0, g: 0, b: 0, a: 0.3 }, // 5am
	{ r: 0, g: 0, b: 0, a: 0.2 }, // 6am
	{ r: 0, g: 0, b: 0, a: 0.1 }, // 7am
	{ r: 0, g: 0, b: 0, a: 0 }, // 8am
	{ r: 0, g: 0, b: 0, a: 0 }, // 9am
	{ r: 0, g: 0, b: 0, a: 0 }, // 10am
	{ r: 0, g: 0, b: 0, a: 0 }, // 11am
	{ r: 0, g: 0, b: 0, a: 0 }, // 12am
	{ r: 0, g: 0, b: 0, a: 0 }, // 1pm
	{ r: 0, g: 0, b: 0, a: 0 }, // 2pm
	{ r: 0, g: 0, b: 0, a: 0 }, // 3pm
	{ r: 0, g: 0, b: 0, a: 0 }, // 4pm
	{ r: 0, g: 0, b: 0, a: 0 }, // 5pm
	{ r: 0, g: 0, b: 0, a: 0 }, // 6pm
	{ r: 0, g: 0, b: 0, a: 0 }, // 7pm
	{ r: 0, g: 0, b: 0, a: 0.1 }, // 8pm
	{ r: 0, g: 0, b: 0, a: 0.2 }, // 9pm
	{ r: 0, g: 0, b: 0, a: 0.3 }, // 10pm
	{ r: 0, g: 0, b: 0, a: 0.3 }, // 11pm
]