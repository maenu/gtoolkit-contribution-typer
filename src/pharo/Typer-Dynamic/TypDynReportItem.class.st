Class {
	#name : #TypDynReportItem,
	#superclass : #Object,
	#instVars : [
		'clazz',
		'name',
		'dyn',
		'inf'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #accessing }
TypDynReportItem >> clazz [

	^ clazz
]

{ #category : #accessing }
TypDynReportItem >> clazz: anObject [

	clazz := anObject
]

{ #category : #accessing }
TypDynReportItem >> dyn [

	^ dyn
]

{ #category : #accessing }
TypDynReportItem >> dyn: anObject [

	dyn := anObject
]

{ #category : #accessing }
TypDynReportItem >> group [

	| d i |
	d := self isUnknown: dyn.
	i := self isUnknown: inf.
	d & i ifTrue: [ ^ 'unknown dyn & inf' ].
	d ifTrue: [ ^ 'unknown dyn' ].
	i ifTrue: [ ^ 'unknown inf' ].
	^ self relation
]

{ #category : #accessing }
TypDynReportItem >> inf [

	^ inf
]

{ #category : #accessing }
TypDynReportItem >> inf: anObject [

	inf := anObject
]

{ #category : #accessing }
TypDynReportItem >> isUnknown: aType [

	^ aType isUnion not and: [ aType >= Object typAsType ]
]

{ #category : #accessing }
TypDynReportItem >> name [

	^ name
]

{ #category : #accessing }
TypDynReportItem >> name: anObject [

	name := anObject
]

{ #category : #printing }
TypDynReportItem >> printOn: aStream [

	aStream
		nextPutAll: dyn asString;
		nextPutAll: ' ';
		nextPutAll: inf asString
]

{ #category : #api }
TypDynReportItem >> relation [

	dyn = inf ifTrue: [ ^ #= ].
	dyn < inf ifTrue: [ ^ #< ].
	dyn > inf ifTrue: [ ^ #> ].
	^ #~=
]
