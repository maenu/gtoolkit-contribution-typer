Class {
	#name : #TypInfImplementorsCache,
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
TypInfImplementorsCache class >> instance [

	^ instance ifNil: [ 
		  instance := self new
			              build;
			              yourself ]
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
				ifPresent: [ :s | s add: m methodClass ]
				ifAbsentPut: [ WeakIdentitySet with: m methodClass ] ] ]
]

{ #category : #accessing }
TypInfImplementorsCache >> implementors: aSymbol [

	^ cache at: aSymbol ifAbsentPut: [ 
		  (aSymbol implementors sorted: [ :a :b | 
			   b methodClass inheritsFrom: a methodClass ])
			  inject: WeakIdentitySet new
			  into: [ :r :e | 
				  r
					  detect: [ :f | e methodClass inheritsFrom: f ]
					  ifNone: [ r add: e methodClass ].
				  r ] ]
]

{ #category : #accessing }
TypInfImplementorsCache >> initialize [

	super initialize.
	cache := Dictionary new
]
