// declare an array to hold one time tasks 
// variables for any interval IDs you'll need for continuous tasks

const oneTimeTasks = []
let intervalId = null

// add one time task function named 

function addOneTimeTask(func, delay) { //what to run, and when to run it. 
    oneTimeTasks.push({ //this will push the parameters to oneTimeTasks
        function: func,
        delay: delay
    });
}

// 

function runOneTimeTasks() {
  oneTimeTasks.forEach((oneTimeTask) => {
    // Schedule this task to run ONE time after oneTimeTask.delay ms
    setTimeout(oneTimeTask.function, oneTimeTask.delay);
  });
}

//

function startMonitoring () {
    console.log("Starting continuous monitoring...");

    monitoringTaskId = setInterval(() => {
    })
    monitoringTaskId.push((startMonitor) => {
        setTimeout()
    };
}

function startMonitoring() {
  console.log("Starting continuous monitoring...");

  // setInterval returns an ID — store it so we can clearInterval later
  monitoringTaskId = setInterval(() => {
    // Simulate changing “space station readings”
    const oxygenLevel = (Math.random() * 100).toFixed(2); // "0.00" to "100.00"
    const temperature = (Math.random() * 100).toFixed(2);

    console.log(
      `Monitoring space station... Oxygen: ${oxygenLevel}%, Temperature: ${temperature}°C`
    );
  }, 2000);
}

// start countdown function

function startCountdown(duration) {
  let timeLeft = duration;
  console.log(`Starting countdown: ${timeLeft} seconds`);

  // Store this countdown interval ID locally (only countdown needs it)
  const countdownTimerId = setInterval(() => {
    timeLeft--; // reduce by 1 each second
    console.log(`T-minus ${timeLeft} seconds`);

    // When we hit 0, stop the interval and announce launch
    if (timeLeft <= 0) {
      clearInterval(countdownTimerId);
      console.log("Liftoff!");
    }
  }, 1000);
}

function startCountdown(duration) {
  let timeLeft = duration;
  console.log(`Starting countdown: ${timeLeft} seconds`);

  // Store this countdown interval ID locally (only countdown needs it)
  const countdownTimerId = setInterval(() => {
    timeLeft--; // reduce by 1 each second
    console.log(`T-minus ${timeLeft} seconds`);

    // When we hit 0, stop the interval and announce launch
    if (timeLeft <= 0) {
      clearInterval(countdownTimerId);
      console.log("🚀 Liftoff!");
    }
  }, 1000);
}

function scheduleMission() {
  // Start the continuous monitoring
  startMonitoring();

  // Schedule a one-time system check completion message
  addOneTimeTask(() => console.log("Pre-launch system check complete."), 5000);

  // Schedule stopping the monitoring
  addOneTimeTask(stopMonitoring, 10000);

  // Schedule the countdown to start (countdown itself lasts 10 seconds)
  addOneTimeTask(() => startCountdown(10), 15000);

  runOneTimeTasks();
}

scheduleMission();
