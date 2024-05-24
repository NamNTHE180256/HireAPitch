<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Soccer Pitch Schedule</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .note-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
        }
        .note {
            position: absolute;
            background-color: #FFFFCC; /* Light yellow */
            border: 1px solid #ccc;
            padding: 5px;
            overflow: hidden;
            white-space: nowrap;
        }
        .status-column {
            position: relative;
        }
    </style>
</head>
<body onload="generateSchedule()">
    <div class="container mt-5">
        <h1 class="mb-4">Soccer Pitch Schedule</h1>
        <div class="row mb-3">
            <div class="col-md-3">
                <label for="datepicker">Select Date:</label>
                <input type="text" id="datepicker" class="form-control">
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-2">
                <label for="startHour">Start Hour:</label>
                <input type="number" id="startHour" class="form-control" min="7" max="23" value="7">
            </div>
            <div class="col-md-2">
                <label for="startMinute">Start Minute:</label>
                <input type="number" id="startMinute" class="form-control" min="0" max="59" value="0">
            </div>
            <div class="col-md-2">
                <label for="endHour">End Hour:</label>
                <input type="number" id="endHour" class="form-control" min="7" max="23" value="7">
            </div>
            <div class="col-md-2">
                <label for="endMinute">End Minute:</label>
                <input type="number" id="endMinute" class="form-control" min="0" max="59" value="0">
            </div>
            <div class="col-md-2">
                <button class="btn btn-primary mt-4" onclick="addInterval()">Add Interval</button>
            </div>
        </div>
        <div class="row position-relative">
            <div class="col-md-12">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Time</th>
                            <th class="status-column">State</th>
                        </tr>
                    </thead>
                    <tbody id="schedule-body">
                        <!-- This is where the schedule rows will be dynamically added -->
                    </tbody>
                </table>
                <div class="note-container" id="note-container"></div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        function generateSchedule() {
            var scheduleBody = document.getElementById("schedule-body");
            scheduleBody.innerHTML = ""; // Clear existing schedule

            for (var hour = 7; hour < 24; hour++) {
                var row = document.createElement("tr");
                var timeCell = document.createElement("td");
                timeCell.textContent = (hour < 10 ? "0" + hour : hour) + ":00";
                row.appendChild(timeCell);

                var stateCell = document.createElement("td");
                stateCell.className = "status-column";
                row.appendChild(stateCell);

                scheduleBody.appendChild(row);
            }
        }

        function addInterval() {
            var startHour = parseInt(document.getElementById("startHour").value);
            var startMinute = parseInt(document.getElementById("startMinute").value);
            var endHour = parseInt(document.getElementById("endHour").value);
            var endMinute = parseInt(document.getElementById("endMinute").value);

            var startTotalMinutes = startHour * 60 + startMinute;
            var endTotalMinutes = endHour * 60 + endMinute;

            var container = document.getElementById("note-container");
            var note = document.createElement("div");
            note.className = "note";

            if (startTotalMinutes <= endTotalMinutes) {
                var startRow = Math.max(startHour - 7, 0);
                var endRow = Math.min(endHour - 7, 17);
                var startCell = (startMinute > 30) ? 1 : 0;
                var endCell = (endMinute > 30) ? 1 : 0;

                var topPos = startRow * 36 + (startMinute > 30 ? 18 : 0);
                var bottomPos = (17 - endRow) * 36 - (endMinute > 30 ? 18 : 0);
                var leftPos = document.querySelector('.status-column').getBoundingClientRect().left;
                var rightPos = (1 - endCell) * 100;

                note.style.top = topPos + "px";
                note.style.bottom = bottomPos + "px";
                note.style.left = leftPos + "px";
                note.style.right = rightPos + "%";
                note.style.width = "calc(100% - " + leftPos + "px - " + (100 - rightPos) + "%)";
                note.style.height = (36 * (endRow - startRow + 1) - (startMinute > 30 ? 9 : 0) - (endMinute > 30 ? 9 : 0)) + "px";

                note.textContent = (startHour < 10 ? "0" + startHour : startHour) + ":" + (startMinute < 10 ? "0" + startMinute : startMinute) + '-' + (endHour < 10 ? "0" + endHour : endHour) + ":" + (endMinute < 10 ? "0" + endMinute : endMinute);
                container.appendChild(note);
            }
        }
    </script>
</body>
</html>
