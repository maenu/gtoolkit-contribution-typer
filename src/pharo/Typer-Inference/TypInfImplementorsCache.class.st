Class {
	#name : #TypInfImplementorsCache,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfImplementorsCache class >> instance [

	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypInfImplementorsCache class >> invalidate [

	<script>
	instance := nil
]

{ #category : #accessing }
TypInfImplementorsCache >> build [

	cache removeAll.
	SystemNavigation new allBehaviors do: [ :b | 
		b methods do: [ :m | 
			cache
				at: m selector
				ifPresent: [ :s | s add: m ]
				ifAbsentPut: [ IdentitySet with: m ] ] ]
]

{ #category : #accessing }
TypInfImplementorsCache >> implementors: aSymbol [

	^ cache at: aSymbol ifAbsentPut: [ aSymbol implementors ]
]

{ #category : #accessing }
TypInfImplementorsCache >> initialize [

	super initialize.
	cache := Dictionary new
]
