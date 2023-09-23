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
						typAt: m methodClass
						at: #canResolveMethod
						at: m typInfAbsCanResolveMethod
						ifAbsentPut: [ IdentitySet new ]) add: m ].
			m typInfAbsIsResolveMethod
				ifTrue: [ (cache
						typAt: m methodClass
						at: #resolveMethod
						at: m typInfAbsResolveMethod
						ifAbsentPut: [ IdentitySet new ]) add: m ] ]
]

{ #category : #accessing }
TypInfAbsIndex >> canResolveMethods: aLookup [
	^ cache
		typAt: aLookup receiver classDescription
		at: #canResolveMethod
		at: aLookup selector
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfAbsIndex >> initialize [
	super initialize.
	cache := IdentityDictionary new
]

{ #category : #accessing }
TypInfAbsIndex >> invalidate [
	cache removeAll
]

{ #category : #accessing }
TypInfAbsIndex >> resolveMethods: aLookup [
	^ cache
		typAt: aLookup receiver classDescription
		at: #resolveMethod
		at: aLookup selector
		ifAbsent: [ #() ]
]
