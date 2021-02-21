Class {
	#name : #TypShaPhaRBMessageNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBMessageNode class >> shadowedClass [
	^ RBMessageNode class
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mArguments: aLookup [ 
	<typShaMethod: 'arguments'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithParameters: {RBValueNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mKeywordsIntervals: aLookup [ 
	<typShaMethod: 'keywordsIntervals'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {(Interval typAsType copyWithParameters: {Integer typAsType})} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mNumArgs: aLookup [ 
	<typShaMethod: 'numArgs'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mReceiver: aLookup [ 
	<typShaMethod: 'receiver'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBValueNode typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBMessageNode >> mSelector: aLookup [ 
	<typShaMethod: 'selector'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]
