Class {
	#name : #TypInfConfiguration,
	#superclass : #Object,
	#instVars : [
		'contextCleanup',
		'nodeChanges',
		'maxIterations',
		'maxImplementors',
		'maxMethodSize',
		'maxWriters',
		'maxNodeStackSize',
		'maxInlinesPerSend'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfConfiguration class >> debug [
	^ self default copy
		contextCleanup: #yourself;
		nodeChanges: #changesDiffFrom:;
		yourself
]

{ #category : #accessing }
TypInfConfiguration class >> default [
	^ default
		ifNil: [ default := self new
					contextCleanup: #cleanup;
					nodeChanges: #changesFrom:;
					maxIterations: 24;
					maxNodeStackSize: 5;
					maxInlinesPerSend: 8;
					maxImplementors: TypInfIndex instance implementors95Quantile;
					maxWriters: TypInfIndex instance writers95Quantile;
					maxMethodSize: TypInfIndex instance methodSize95Quantile;
					yourself ]
]

{ #category : #accessing }
TypInfConfiguration class >> invalidate [
	default := nil
]

{ #category : #accessing }
TypInfConfiguration >> contextCleanup [
	^ contextCleanup
]

{ #category : #accessing }
TypInfConfiguration >> contextCleanup: anObject [
	contextCleanup := anObject
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

{ #category : #accessing }
TypInfConfiguration >> nodeChanges [
	^ nodeChanges
]

{ #category : #accessing }
TypInfConfiguration >> nodeChanges: anObject [
	nodeChanges := anObject
]
