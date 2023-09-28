Class {
	#name : #TypInfMethodMeasurement,
	#superclass : #Object,
	#instVars : [
		'error',
		'duration',
		'tally',
		'context'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethodMeasurement class >> duration: aDuration context: aType error: anError tally: aTally [
	^ self new
		initializeDuration: aDuration
			context: aType
			error: anError
			tally: aTally;
		yourself
]

{ #category : #accessing }
TypInfMethodMeasurement class >> method: aMethod [
]

{ #category : #accessing }
TypInfMethodMeasurement >> duration [

	^ duration
]

{ #category : #accessing }
TypInfMethodMeasurement >> gtContextFor: aView [

	<gtView>
	context ifNil: [ ^ aView empty ].
	^ aView explicit
		  title: 'Context';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: context ]
]

{ #category : #accessing }
TypInfMethodMeasurement >> gtControlFlowFor: aView [

	<gtView>
	^ aView forward
		  title: 'Control Flow';
		  priority: 10;
		  object: [ context ];
		  view: #typGtFlowFor:
]

{ #category : #accessing }
TypInfMethodMeasurement >> gtErrorFor: aView [

	<gtView>
	error ifNil: [ ^ aView empty ].
	^ aView explicit
		  title: 'Error';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: error ]
]

{ #category : #accessing }
TypInfMethodMeasurement >> initializeDuration: aDuration context: aContext error: anError tally: aTally [
	duration := aDuration.
	context := aContext.
	error := anError.
	tally := aTally
]

{ #category : #accessing }
TypInfMethodMeasurement >> isError [

	^ error isNotNil
]

{ #category : #accessing }
TypInfMethodMeasurement >> isSuccess [

	^ context isNotNil
]

{ #category : #accessing }
TypInfMethodMeasurement >> printOn: aStream [
	self isSuccess
		ifTrue: [ aStream
				nextPutAll: 'success ';
				nextPutAll: duration asString;
				nextPutAll: ' '.
			^ context printOn: aStream ].
	aStream
		nextPutAll: 'error ';
		nextPutAll: duration asString;
		nextPutAll: ' '.
	^ error printOn: aStream
]

{ #category : #accessing }
TypInfMethodMeasurement >> tally: aTally [
	tally := aTally
]
