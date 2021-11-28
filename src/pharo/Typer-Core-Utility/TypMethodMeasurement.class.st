Class {
	#name : #TypMethodMeasurement,
	#superclass : #Object,
	#instVars : [
		'result',
		'process',
		'error',
		'method'
	],
	#category : #'Typer-Core-Utility-Typer-Core-Utility'
}

{ #category : #accessing }
TypMethodMeasurement class >> method: aMethod [
]

{ #category : #accessing }
TypMethodMeasurement class >> method: aMethod error: anError [

	^ self new
		  initializeMethod: aMethod
		  result: nil
		  error: anError
		  process: nil;
		  yourself
]

{ #category : #accessing }
TypMethodMeasurement class >> method: aMethod process: aProcess [

	^ self new
		  initializeMethod: aMethod
		  result: nil
		  error: nil
		  process: aProcess;
		  yourself
]

{ #category : #accessing }
TypMethodMeasurement class >> method: aMethod result: aType [

	^ self new
		  initializeMethod: aMethod
		  result: aType
		  error: nil
		  process: nil;
		  yourself
]

{ #category : #accessing }
TypMethodMeasurement >> finalize [

	process ifNotNil: #terminate.
	super finalize
]

{ #category : #accessing }
TypMethodMeasurement >> initializeMethod: aMethod result: aType error: anError process: aProcess [

	method := aMethod.
	result := aType.
	error := anError.
	process := aProcess
]

{ #category : #accessing }
TypMethodMeasurement >> isError [

	^ error isNotNil
]

{ #category : #accessing }
TypMethodMeasurement >> isSuccess [

	^ result isNotNil
]

{ #category : #accessing }
TypMethodMeasurement >> isTimeout [

	^ process isNotNil
]

{ #category : #accessing }
TypMethodMeasurement >> printOn: aStream [

	self isSuccess ifTrue: [ ^ aStream nextPutAll: 'success' ].
	self isError ifTrue: [ ^ aStream nextPutAll: 'error' ].
	self isTimeout ifTrue: [ ^ aStream nextPutAll: 'timeout' ]
]
