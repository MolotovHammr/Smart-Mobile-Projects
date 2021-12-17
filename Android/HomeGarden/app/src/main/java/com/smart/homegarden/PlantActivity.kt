package com.smart.homegarden

import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.AdapterView
import android.widget.ImageView
import android.widget.TextView
import androidx.annotation.RequiresApi
import com.smart.homegarden.Data.Plant
import com.smart.homegarden.databinding.ActivityPlantBinding

class PlantActivity : AppCompatActivity(), SensorEventListener {

    private lateinit var binding: ActivityPlantBinding
    private lateinit var sensorManager: SensorManager

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPlantBinding.inflate(layoutInflater)

        setContentView(binding.root)

        val plant: Plant = intent.getSerializableExtra("PLANT") as Plant

        binding.plantName.text = plant.plantName
        binding.speechText.text = "Hello again, remember to water me with ${plant.waterAmount}ml of water every ${plant.wateringFrequency} days"

             setupSensor()
    }

        @RequiresApi(Build.VERSION_CODES.KITKAT)
        private fun setupSensor(){
        sensorManager = getSystemService(SENSOR_SERVICE) as SensorManager

        sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)?.also {
            sensorManager.registerListener(this, it, SensorManager.SENSOR_DELAY_FASTEST, SensorManager.SENSOR_DELAY_FASTEST)
        }
    }

    override fun onSensorChanged(event: SensorEvent?) {
        if (event?.sensor?.type == Sensor.TYPE_ACCELEROMETER){
            val sides = event.values[0]
            val upDown = event.values[1]

            binding.plantImage.apply {
                if (sides.toInt() < -2 || sides.toInt() > 2) {
                    translationX = sides * -20
                    translationY = upDown * 10
                }
            }
        }
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {
        return
    }

    override fun onDestroy() {
        sensorManager.unregisterListener(this)
        super.onDestroy()
    }
}

