Class {
	#name : #TypInfConfiguration,
	#superclass : #Object,
	#instVars : [
		'maxIterations',
		'maxImplementors',
		'maxMethodSize',
		'maxWriters',
		'maxNodeStackSize',
		'maxInlinesPerSend',
		'afterContextIterate'
	],
	#classInstVars : [
		'debug',
		'default'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfConfiguration class >> debug [
	^ debug
		ifNil: [ debug := self default copy
					afterContextIterate: #yourself;
					yourself ]
]

{ #category : #accessing }
TypInfConfiguration class >> default [
	^ default
		ifNil: [ default := self new
					afterContextIterate: #reduce;
					maxIterations: 16;
					maxNodeStackSize: 5;
					maxInlinesPerSend: 8;
					maxImplementors: TypInfIndex instance implementors95Quantile;
					maxWriters: TypInfIndex instance writers95Quantile;
					maxMethodSize: TypInfIndex instance methodSize95Quantile;
					yourself ]
]

{ #category : #accessing }
TypInfConfiguration class >> invalidate [
	default := nil.
	debug := nil
]

{ #category : #accessing }
TypInfConfiguration >> afterContextIterate [
	^ afterContextIterate
]

{ #category : #accessing }
TypInfConfiguration >> afterContextIterate: anObject [
	afterContextIterate := anObject
]

{ #category : #accessing }
TypInfConfiguration >> maxImplementors [
	^ maxImplementors
]

{ #category : #accessing }
TypInfConfiguration >> maxImplementors: anObject [
	maxImplementors := anObject
]

{ #category : #accessing }
TypInfConfiguration >> maxInlinesPerSend [
	^ maxInlinesPerSend
]

{ #category : #accessing }
TypInfConfiguration >> maxInlinesPerSend: anObject [
	maxInlinesPerSend := anObject
]

{ #category : #accessing }
TypInfConfiguration >> maxIterations [
	^ maxIterations
]

{ #category : #accessing }
TypInfConfiguration >> maxIterations: anObject [
	maxIterations := anObject
]

{ #category : #accessing }
TypInfConfiguration >> maxMethodSize [
	^ maxMethodSize
]

{ #category : #accessing }
TypInfConfiguration >> maxMethodSize: anObject [
	maxMethodSize := anObject
]

{ #category : #accessing }
TypInfConfiguration >> maxNodeStackSize [
	^ maxNodeStackSize
]

{ #category : #accessing }
TypInfConfiguration >> maxNodeStackSize: anObject [
	maxNodeStackSize := anObject
]

{ #category : #accessing }
TypInfConfiguration >> maxWriters [
	^ maxWriters
]

{ #category : #accessing }
TypInfConfiguration >> maxWriters: anObject [
	maxWriters := anObject
]
