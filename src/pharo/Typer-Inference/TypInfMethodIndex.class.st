Class {
	#name : #TypInfMethodIndex,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethodIndex class >> instance [

	^ instance ifNil: [ 
		  instance := self new
			              build;
			              yourself ]
]

{ #category : #accessing }
TypInfMethodIndex class >> invalidate [

	<script>
	instance := nil
]

{ #category : #accessing }
TypInfMethodIndex >> build [

	| behaviors |
	cache removeAll.
	"toposort superclasses before subclasses so #allSuperclasses are initialized"
	behaviors := ProtoObject withAllSubclasses asOrderedCollection.
	"ProtoObject is last for some reason"
	behaviors addFirst: behaviors removeLast.
	behaviors addAll: ProtoObject class withAllSubclasses.
	behaviors do: [ :b | 
		| variables |
		variables := b instanceVariables asIdentitySet.
		b isClass ifTrue: [ variables addAll: b classVariables ].
		variables do: [ :v | cache at: v put: IdentitySet new ].
		b allSuperclassesDo: [ :bb | variables addAll: (cache at: bb) ].
		cache at: b put: variables.
		b methods do: [ :m | 
			variables
				select: [ :v | v typInfIsWrittenIn: m ]
				thenDo: [ :v | (cache at: v) add: m ].
			cache
				at: m selector
				ifPresent: [ :s | s add: b ]
				ifAbsentPut: [ IdentitySet with: b ] ] ]
]

{ #category : #accessing }
TypInfMethodIndex >> implementors: aSymbol [

	^ cache at: aSymbol
]

{ #category : #accessing }
TypInfMethodIndex >> initialize [

	super initialize.
	cache := IdentityDictionary new
]

{ #category : #generated }
TypInfMethodIndex >> writers: aVariable [

	^ cache at: aVariable
]
