using UnityEngine;

public class ObjectManipulator : MonoBehaviour
{
    private float translationTimer = 0f;
    private float translationInterval = 2f;
    private float rotationSpeed = 50f;

    void Update()
    {
        translationTimer += Time.deltaTime;
        if (translationTimer >= translationInterval)
        {
            translationTimer = 0f;
            int axis = Random.Range(0, 2);
            float distance = Random.Range(-1f, 1f);
            Vector3 movement = Vector3.zero;
            if (axis == 0)
                movement.x = distance;
            else
                movement.y = distance;
            transform.Translate(movement, Space.World);
        }

        transform.Rotate(Vector3.up, rotationSpeed * Time.deltaTime, Space.Self);
        float scaleFactor = 1 + 0.5f * Mathf.Sin(Time.time);
        transform.localScale = new Vector3(scaleFactor, scaleFactor, scaleFactor);
    }
}