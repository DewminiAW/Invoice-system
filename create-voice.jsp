<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Voice Note - Invoice System</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Voice Creation Page Styles */
        :root {
            --voice-primary: #8b5cf6;
            --voice-secondary: #ec4899;
            --voice-gradient: linear-gradient(135deg, #8b5cf6 0%, #ec4899 100%);
            --voice-light: #f3e8ff;
        }

        .voice-container {
            max-width: 1000px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        /* Header */
        .voice-header {
            background: var(--voice-gradient);
            color: white;
            padding: 2rem;
            border-radius: 20px 20px 0 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .voice-header::before {
            content: '🎤';
            position: absolute;
            font-size: 8rem;
            opacity: 0.1;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
        }

        .voice-header h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .voice-header p {
            font-size: 1.1rem;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        /* Main Card */
        .voice-card {
            background: white;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 10px 40px rgba(139, 92, 246, 0.2);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        /* Voice Recorder Section */
        .recorder-section {
            text-align: center;
            padding: 2rem;
            background: var(--voice-light);
            border-radius: 15px;
            margin-bottom: 2rem;
        }

        .voice-wave {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            height: 100px;
            margin-bottom: 2rem;
        }

        .wave-bar {
            width: 8px;
            height: 30px;
            background: var(--voice-primary);
            border-radius: 4px;
            animation: wave 1s ease-in-out infinite;
        }

        .wave-bar:nth-child(2) { animation-delay: 0.1s; }
        .wave-bar:nth-child(3) { animation-delay: 0.2s; }
        .wave-bar:nth-child(4) { animation-delay: 0.3s; }
        .wave-bar:nth-child(5) { animation-delay: 0.4s; }
        .wave-bar:nth-child(6) { animation-delay: 0.5s; }
        .wave-bar:nth-child(7) { animation-delay: 0.6s; }
        .wave-bar:nth-child(8) { animation-delay: 0.7s; }
        .wave-bar:nth-child(9) { animation-delay: 0.8s; }
        .wave-bar:nth-child(10) { animation-delay: 0.9s; }

        @keyframes wave {
            0%, 100% { height: 30px; }
            50% { height: 80px; }
        }

        .recording-time {
            font-size: 2rem;
            font-weight: 700;
            color: var(--voice-primary);
            margin-bottom: 1rem;
            font-family: monospace;
        }

        /* Voice Buttons */
        .voice-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        .voice-btn {
            padding: 1rem 2rem;
            border: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-record {
            background: var(--voice-gradient);
            color: white;
            box-shadow: 0 4px 15px rgba(139, 92, 246, 0.4);
        }

        .btn-record:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(139, 92, 246, 0.6);
        }

        .btn-stop {
            background: #ef4444;
            color: white;
            display: none;
        }

        .btn-stop:hover {
            background: #dc2626;
        }

        .btn-pause {
            background: #f59e0b;
            color: white;
            display: none;
        }

        .btn-pause:hover {
            background: #d97706;
        }

        .btn-resume {
            background: #10b981;
            color: white;
            display: none;
        }

        .btn-resume:hover {
            background: #059669;
        }

        /* Voice List */
        .voice-list {
            margin-top: 2rem;
        }

        .voice-list h3 {
            font-size: 1.5rem;
            color: #1f2937;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .voice-items {
            display: grid;
            gap: 1rem;
        }

        .voice-item {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 1rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: all 0.3s ease;
        }

        .voice-item:hover {
            background: white;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transform: translateX(5px);
        }

        .voice-icon {
            width: 50px;
            height: 50px;
            background: var(--voice-gradient);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
        }

        .voice-details {
            flex: 1;
        }

        .voice-name {
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 0.25rem;
        }

        .voice-meta {
            display: flex;
            gap: 1rem;
            font-size: 0.875rem;
            color: #6b7280;
        }

        .voice-actions {
            display: flex;
            gap: 0.5rem;
        }

        .voice-action-btn {
            padding: 0.5rem;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: white;
            color: #4b5563;
        }

        .voice-action-btn:hover {
            background: var(--voice-primary);
            color: white;
        }

        .play-btn:hover {
            background: #10b981;
        }

        .download-btn:hover {
            background: #3b82f6;
        }

        .delete-btn:hover {
            background: #ef4444;
        }

        /* Form Section */
        .voice-form {
            margin-top: 2rem;
            padding: 2rem;
            background: #f9fafb;
            border-radius: 15px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #1f2937;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 2px solid #e5e7eb;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--voice-primary);
            box-shadow: 0 0 0 3px rgba(139, 92, 246, 0.2);
        }

        select.form-control {
            background: white;
            cursor: pointer;
        }

        textarea.form-control {
            resize: vertical;
            min-height: 100px;
        }

        /* Tags */
        .tags-container {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .tag {
            background: var(--voice-light);
            color: var(--voice-primary);
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.875rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .tag i {
            cursor: pointer;
        }

        .tag i:hover {
            color: #ef4444;
        }

        /* Progress Bar */
        .audio-progress {
            width: 100%;
            height: 5px;
            background: #e5e7eb;
            border-radius: 5px;
            margin: 1rem 0;
            cursor: pointer;
            position: relative;
        }

        .progress-fill {
            height: 100%;
            background: var(--voice-gradient);
            border-radius: 5px;
            width: 0%;
            position: relative;
        }

        .progress-fill::after {
            content: '';
            position: absolute;
            right: -5px;
            top: 50%;
            transform: translateY(-50%);
            width: 12px;
            height: 12px;
            background: white;
            border: 2px solid var(--voice-primary);
            border-radius: 50%;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .voice-header h1 {
                font-size: 2rem;
            }

            .voice-item {
                flex-direction: column;
                text-align: center;
            }

            .voice-actions {
                justify-content: center;
            }

            .voice-meta {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="main-header">
        <nav class="nav-menu">
            <div class="logo-container">
                <img src="images/1.jpg" alt="Logo" onerror="this.src='https://via.placeholder.com/50'">
                <h2>Invoice System</h2>
            </div>
            <ul class="nav-links">
                <li><a href="dashboard.jsp">Dashboard</a></li>
                <li><a href="view-invoices.jsp">Invoices</a></li>
                <li><a href="create-invoice.jsp">Create Invoice</a></li>
                <li><a href="product.jsp">Products</a></li>
                <li><a href="create-voice.jsp" class="active">Voice Notes</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main Content -->
    <div class="voice-container">
        <!-- Voice Header -->
        <div class="voice-header">
            <h1>Create Voice Note</h1>
            <p>Record voice notes for your invoices and reminders</p>
        </div>

        <!-- Main Card -->
        <div class="voice-card">
            <!-- Recorder Section -->
            <div class="recorder-section">
                <div class="voice-wave" id="voiceWave">
                    <div class="wave-bar"></div>
                    <div class="wave-bar"></div>
                    <div class="wave-bar"></div>
                    <div class="wave-bar"></div>
                    <div class="wave-bar"></div>
                    <div class="wave-bar"></div>
                    <div class="wave-bar"></div>
                    <div class="wave-bar"></div>
                    <div class="wave-bar"></div>
                    <div class="wave-bar"></div>
                </div>

                <div class="recording-time" id="recordingTime">00:00</div>

                <div class="voice-buttons">
                    <button class="voice-btn btn-record" id="startRecordBtn" onclick="startRecording()">
                        <span>🎤</span> Start Recording
                    </button>
                    <button class="voice-btn btn-pause" id="pauseRecordBtn" onclick="pauseRecording()">
                        <span>⏸️</span> Pause
                    </button>
                    <button class="voice-btn btn-resume" id="resumeRecordBtn" onclick="resumeRecording()">
                        <span>▶️</span> Resume
                    </button>
                    <button class="voice-btn btn-stop" id="stopRecordBtn" onclick="stopRecording()">
                        <span>⏹️</span> Stop
                    </button>
                </div>

                <!-- Audio Player (shows after recording) -->
                <div id="audioPlayer" style="display: none; margin-top: 2rem;">
                    <audio controls id="recordedAudio" style="width: 100%;"></audio>
                </div>
            </div>

            <!-- Voice Details Form -->
            <div class="voice-form" id="voiceForm" style="display: none;">
                <h3 style="margin-bottom: 1.5rem; color: #1f2937;">Save Voice Note</h3>

                <form id="saveVoiceForm" onsubmit="return saveVoiceNote(event)">
                    <div class="form-group">
                        <label for="voiceTitle">Title <span style="color: #ef4444;">*</span></label>
                        <input type="text" class="form-control" id="voiceTitle" required
                               placeholder="e.g., Invoice Reminder, Meeting Note">
                    </div>

                    <div class="form-group">
                        <label for="voiceDescription">Description</label>
                        <textarea class="form-control" id="voiceDescription"
                                  placeholder="Add notes about this recording..."></textarea>
                    </div>

                    <div class="form-row" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                        <div class="form-group">
                            <label for="voiceCategory">Category</label>
                            <select class="form-control" id="voiceCategory">
                                <option value="invoice">Invoice Related</option>
                                <option value="client">Client Meeting</option>
                                <option value="reminder">Reminder</option>
                                <option value="other">Other</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="voiceTags">Tags</label>
                            <input type="text" class="form-control" id="voiceTags"
                                   placeholder="Comma separated (e.g., urgent, client)">
                        </div>
                    </div>

                    <div class="tags-container" id="tagsDisplay"></div>

                    <div style="display: flex; gap: 1rem; justify-content: flex-end; margin-top: 2rem;">
                        <button type="button" class="voice-btn" style="background: #e5e7eb; color: #1f2937;"
                                onclick="cancelSave()">Cancel</button>
                        <button type="submit" class="voice-btn btn-record">Save Voice Note</button>
                    </div>
                </form>
            </div>

            <!-- Saved Voice Notes List -->
            <div class="voice-list">
                <h3>
                    <span>📋</span> Recent Voice Notes
                </h3>

                <div class="voice-items" id="voiceItems">
                    <!-- Voice items will be loaded here -->
                    <div class="voice-item">
                        <div class="voice-icon">🎤</div>
                        <div class="voice-details">
                            <div class="voice-name">Invoice Reminder - Client Meeting</div>
                            <div class="voice-meta">
                                <span>2:34 min</span>
                                <span>•</span>
                                <span>2.3 MB</span>
                                <span>•</span>
                                <span>Today</span>
                            </div>
                        </div>
                        <div class="voice-actions">
                            <button class="voice-action-btn play-btn" onclick="playVoice(this)">▶️</button>
                            <button class="voice-action-btn download-btn" onclick="downloadVoice(this)">📥</button>
                            <button class="voice-action-btn delete-btn" onclick="deleteVoice(this)">🗑️</button>
                        </div>
                    </div>

                    <div class="voice-item">
                        <div class="voice-icon">🎤</div>
                        <div class="voice-details">
                            <div class="voice-name">Payment Follow-up</div>
                            <div class="voice-meta">
                                <span>1:15 min</span>
                                <span>•</span>
                                <span>1.1 MB</span>
                                <span>•</span>
                                <span>Yesterday</span>
                            </div>
                        </div>
                        <div class="voice-actions">
                            <button class="voice-action-btn play-btn" onclick="playVoice(this)">▶️</button>
                            <button class="voice-action-btn download-btn" onclick="downloadVoice(this)">📥</button>
                            <button class="voice-action-btn delete-btn" onclick="deleteVoice(this)">🗑️</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Voice Recording Variables
        let mediaRecorder;
        let audioChunks = [];
        let recordingTimer;
        let seconds = 0;
        let isRecording = false;
        let isPaused = false;
        let audioBlob;

        // DOM Elements
        const startBtn = document.getElementById('startRecordBtn');
        const pauseBtn = document.getElementById('pauseRecordBtn');
        const resumeBtn = document.getElementById('resumeRecordBtn');
        const stopBtn = document.getElementById('stopRecordBtn');
        const voiceWave = document.getElementById('voiceWave');
        const recordingTime = document.getElementById('recordingTime');
        const audioPlayer = document.getElementById('audioPlayer');
        const recordedAudio = document.getElementById('recordedAudio');
        const voiceForm = document.getElementById('voiceForm');

        // Check if browser supports audio recording
        if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
            alert('Your browser does not support audio recording. Please use Chrome, Firefox, or Edge.');
        }

        // Start Recording
        async function startRecording() {
            try {
                const stream = await navigator.mediaDevices.getUserMedia({ audio: true });

                mediaRecorder = new MediaRecorder(stream);
                audioChunks = [];

                mediaRecorder.ondataavailable = event => {
                    audioChunks.push(event.data);
                };

                mediaRecorder.onstop = () => {
                    audioBlob = new Blob(audioChunks, { type: 'audio/wav' });
                    const audioUrl = URL.createObjectURL(audioBlob);
                    recordedAudio.src = audioUrl;

                    // Show audio player and form
                    audioPlayer.style.display = 'block';
                    voiceForm.style.display = 'block';

                    // Stop all tracks
                    stream.getTracks().forEach(track => track.stop());
                };

                mediaRecorder.start();
                isRecording = true;
                startTimer();

                // Update UI
                startBtn.style.display = 'none';
                pauseBtn.style.display = 'inline-flex';
                stopBtn.style.display = 'inline-flex';
                voiceWave.style.opacity = '1';

            } catch (err) {
                console.error('Error accessing microphone:', err);
                alert('Could not access microphone. Please check permissions.');
            }
        }

        // Pause Recording
        function pauseRecording() {
            if (mediaRecorder && isRecording && !isPaused) {
                mediaRecorder.pause();
                isPaused = true;
                clearInterval(recordingTimer);

                // Update UI
                pauseBtn.style.display = 'none';
                resumeBtn.style.display = 'inline-flex';
                voiceWave.style.opacity = '0.5';
            }
        }

        // Resume Recording
        function resumeRecording() {
            if (mediaRecorder && isRecording && isPaused) {
                mediaRecorder.resume();
                isPaused = false;
                startTimer();

                // Update UI
                resumeBtn.style.display = 'none';
                pauseBtn.style.display = 'inline-flex';
                voiceWave.style.opacity = '1';
            }
        }

        // Stop Recording
        function stopRecording() {
            if (mediaRecorder && isRecording) {
                mediaRecorder.stop();
                isRecording = false;
                clearInterval(recordingTimer);

                // Update UI
                startBtn.style.display = 'inline-flex';
                pauseBtn.style.display = 'none';
                resumeBtn.style.display = 'none';
                stopBtn.style.display = 'none';
                voiceWave.style.opacity = '0.5';
            }
        }

        // Timer Function
        function startTimer() {
            recordingTimer = setInterval(() => {
                seconds++;
                const mins = Math.floor(seconds / 60);
                const secs = seconds % 60;
                recordingTime.textContent = `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
            }, 1000);
        }

        // Save Voice Note
        function saveVoiceNote(event) {
            event.preventDefault();

            const title = document.getElementById('voiceTitle').value;
            const description = document.getElementById('voiceDescription').value;
            const category = document.getElementById('voiceCategory').value;
            const tags = document.getElementById('voiceTags').value;

            if (!title) {
                alert('Please enter a title');
                return false;
            }

            // Here you would typically upload the audio blob to server
            // using AJAX FormData

            const formData = new FormData();
            formData.append('audio', audioBlob, `${title}.wav`);
            formData.append('title', title);
            formData.append('description', description);
            formData.append('category', category);
            formData.append('tags', tags);
            formData.append('duration', recordingTime.textContent);

            // Simulate upload
            alert('Voice note saved successfully!');

            // Reset form
            resetRecorder();

            return false;
        }

        // Cancel Save
        function cancelSave() {
            if (confirm('Discard this recording?')) {
                resetRecorder();
            }
        }

        // Reset Recorder
        function resetRecorder() {
            seconds = 0;
            recordingTime.textContent = '00:00';
            audioPlayer.style.display = 'none';
            voiceForm.style.display = 'none';
            document.getElementById('saveVoiceForm').reset();

            // Clear tags
            document.getElementById('tagsDisplay').innerHTML = '';
        }

        // Play Voice
        function playVoice(btn) {
            const voiceItem = btn.closest('.voice-item');
            const voiceName = voiceItem.querySelector('.voice-name').textContent;

            // Here you would play the actual audio file
            alert(`Playing: ${voiceName}`);
        }

        // Download Voice
        function downloadVoice(btn) {
            const voiceItem = btn.closest('.voice-item');
            const voiceName = voiceItem.querySelector('.voice-name').textContent;

            // Here you would trigger download
            alert(`Downloading: ${voiceName}`);
        }

        // Delete Voice
        function deleteVoice(btn) {
            if (confirm('Are you sure you want to delete this voice note?')) {
                const voiceItem = btn.closest('.voice-item');
                voiceItem.remove();
            }
        }

        // Tags input handler
        document.getElementById('voiceTags').addEventListener('input', function(e) {
            const tags = e.target.value.split(',').map(tag => tag.trim()).filter(tag => tag);
            const tagsDisplay = document.getElementById('tagsDisplay');

            tagsDisplay.innerHTML = tags.map(tag =>
                `<span class="tag">#${tag} <i onclick="this.parentElement.remove()">✕</i></span>`
            ).join('');
        });

        // Initialize
        document.addEventListener('DOMContentLoaded', function() {
            console.log('Voice creation page loaded');
        });
    </script>
</body>
</html>