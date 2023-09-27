Class {
	#name : #TypMethodMeasurement,
	#superclass : #Object,
	#instVars : [
		'result',
		'process',
		'error',
		'method',
		'duration',
		'tally'
	],
	#category : #'Typer-Core-Utility'
}

{ #category : #accessing }
TypMethodMeasurement class >> method: aMethod [
]

{ #category : #accessing }
TypMethodMeasurement class >> method: aMethod duration: aDuration result: aType error: anError process: aProcess tally: aTally [
	^ self new
		initializeMethod: aMethod
			duration: aDuration
			result: aType
			error: anError
			process: aProcess
			tally: aTally;
		yourself
]

{ #category : #accessing }
TypMethodMeasurement >> duration [

	^ duration
]

{ #category : #accessing }
TypMethodMeasurement >> finalize [

	process ifNotNil: #terminate.
	super finalize
]

{ #category : #accessing }
TypMethodMeasurement >> gtControlFlowFor: aView [

	<gtView>
	^ aView forward
		  title: 'Control Flow';
		  priority: 10;
		  object: [ result ];
		  view: #typGtFlowFor:
]

{ #category : #accessing }
TypMethodMeasurement >> gtErrorFor: aView [

	<gtView>
	error ifNil: [ ^ aView empty ].
	^ aView explicit
		  title: 'Error';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: error ]
]

{ #category : #accessing }
TypMethodMeasurement >> gtMethodFor: aView [

	<gtView>
	^ aView explicit
		  title: 'Method';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: method ]
]

{ #category : #accessing }
TypMethodMeasurement >> gtResultFor: aView [

	<gtView>
	result ifNil: [ ^ aView empty ].
	^ aView explicit
		  title: 'Result';
		  priority: 10;
		  stencil: [ GtInspectorTool forObject: result ]
]

{ #category : #accessing }
TypMethodMeasurement >> initializeMethod: aMethod duration: aDuration result: aType error: anError process: aProcess tally: aTally [
	method := aMethod.
	duration := aDuration.
	result := aType.
	error := anError.
	process := aProcess.
	tally := aTally
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

	self isSuccess ifTrue: [ 
		aStream
			nextPutAll: 'success ';
			nextPutAll: duration asString;
			nextPutAll: ' '.
		^ result printOn: aStream ].
	self isError ifTrue: [ 
		aStream
			nextPutAll: 'error ';
			nextPutAll: duration asString;
			nextPutAll: ' '.
		^ error printOn: aStream ].
	self isTimeout ifTrue: [ ^ aStream nextPutAll: 'timeout' ]
]

{ #category : #accessing }
TypMethodMeasurement >> tally: aTally [
	tally := aTally
]

{ #category : #accessing }
TypMethodMeasurement >> terminate [

	process ifNotNil: #terminate
]
