Class {
	#name : #TypShaPhaContext,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaContext class >> shadowedClass [
	^ Context class
]

{ #category : #shadow }
TypShaPhaContext >> mArguments: aLookup [ 
	<typShaMethod: 'arguments'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | SequenceableCollection typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaContext >> mMethod: aLookup [ 
	<typShaMethod: 'method'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | CompiledMethod typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaContext >> mReceiver: aLookup [ 
	<typShaMethod: 'receiver'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Object typAsType ];
		yourself
]
