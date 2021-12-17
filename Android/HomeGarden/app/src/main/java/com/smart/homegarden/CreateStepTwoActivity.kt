package com.smart.homegarden

import android.app.Activity
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.smart.homegarden.Data.Plant
import com.smart.homegarden.databinding.ActivityCreateBinding
import com.smart.homegarden.databinding.ActivityCreateStepTwoBinding

class CreateStepTwoActivity : AppCompatActivity() {

    private lateinit var binding: ActivityCreateStepTwoBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityCreateStepTwoBinding.inflate(layoutInflater)
        setContentView(binding.root)

        //Get Name from activity creator
        val plantName: String? = intent.getStringExtra("plantName")
        val colour: String? = intent.getStringExtra("plantColour")

        binding.plantNameCreateTwo.text = plantName
        createCreatePlantButton(plantName!!, colour!!)
    }

    private fun createCreatePlantButton(plantName: String, colour: String) {

        binding.finishPlant.setOnClickListener {

            val waterAmount = binding.editTextWaterAmount.text.toString().toInt()
            val wateringFrequency = binding.editTextWateringFrequency.text.toString().toInt()
            val colourPlant = colour
            val newPlant: Plant = Plant(1, "$colourPlant $plantName" , "$plantName image", colourPlant, waterAmount, wateringFrequency)
            Log.d("Test","wat is dit: $newPlant")
            intent.putExtra("newPlant", newPlant)
            setResult(Activity.RESULT_OK, intent)
            finish()
        }
    }
}