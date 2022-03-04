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

	cache removeAll.
	SystemNavigation new allBehaviors do: [ :b | 
		b instanceVariables do: [ :e | cache at: e put: IdentitySet new ].
		b isClass ifTrue: [ 
			b classVariables do: [ :e | cache at: e put: IdentitySet new ] ] ].
	SystemNavigation new allBehaviors do: [ :b | 
		b methods do: [ :m | 
			m ast variableWriteNodes
				collect: #variable
				thenDo: [ :v | cache at: v ifPresent: [ :s | s add: m ] ].
			cache
				at: m selector
				ifPresent: [ :s | s add: m methodClass ]
				ifAbsentPut: [ IdentitySet with: m methodClass ] ] ]
]

{ #category : #accessing }
TypInfMethodIndex >> implementors: aSymbol [

	^ cache at: aSymbol ifAbsentPut: [ 
		  (aSymbol implementors sorted: [ :a :b | 
			   b methodClass inheritsFrom: a methodClass ])
			  inject: IdentitySet new
			  into: [ :r :e | 
				  r
					  detect: [ :f | e methodClass inheritsFrom: f ]
					  ifNone: [ r add: e methodClass ].
				  r ] ]
]

{ #category : #accessing }
TypInfMethodIndex >> initialize [

	super initialize.
	cache := IdentityDictionary new
]

{ #category : #generated }
TypInfMethodIndex >> writers: aVariable [

	^ cache at: aVariable ifAbsentPut: [ 
		  (aVariable astNodes select: #isWrite)
			  collect: [ :e | e methodNode compiledMethod ]
			  as: IdentitySet ]
]
