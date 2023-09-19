Class {
	#name : #TypInfAbsIndex,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Inference-AbstractInterpretation'
}

{ #category : #accessing }
TypInfAbsIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new
			              build;
			              yourself ]
]

{ #category : #accessing }
TypInfAbsIndex class >> invalidate [

	<script>
	instance ifNotNil: #invalidate.
	instance := nil
]

{ #category : #accessing }
TypInfAbsIndex >> build [
	cache removeAll.
	Smalltalk globals allMethods
		do: [ :m | 
			m typInfAbsIsCanResolve
				ifTrue: [ (cache
						at: m methodClass -> #canResolveMethod -> m typInfAbsCanResolve
						ifAbsentPut: [ IdentitySet new ]) add: m ].
			m typInfAbsIsResolveMethod
				ifTrue: [ (cache
						at: m methodClass -> #resolveMethod -> m typInfAbsResolveMethod
						ifAbsentPut: [ IdentitySet new ]) add: m ] ]
]

{ #category : #accessing }
TypInfAbsIndex >> canResolveMethod: aLookup [
	| classDescription |
	aLookup root typInfMessage ifNil: [ ^ false ].
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	classDescription := aLookup receiver classDescription.
	^ cache
		at: classDescription -> #canResolveMethod -> aLookup selector
		ifPresent: [ :s | 
			s
				allSatisfy: [ :m | nil rFwithArgs: {aLookup root typInfMessage} executeMethod: m ] ]
		ifAbsent: [ self flag: 'TODO should listen to change events'.
			false ]
]

{ #category : #accessing }
TypInfAbsIndex >> initialize [
	super initialize.
	cache := Dictionary new
]

{ #category : #accessing }
TypInfAbsIndex >> invalidate [
	cache removeAll
]

{ #category : #accessing }
TypInfAbsIndex >> resolveMethod: aLookup [
	| classDescription |
	classDescription := aLookup receiver classDescription.
	^ (cache at: classDescription -> #resolveMethod -> aLookup selector)
		collect: [ :m | nil rFwithArgs: {aLookup root typInfMessage} executeMethod: m ]
]
