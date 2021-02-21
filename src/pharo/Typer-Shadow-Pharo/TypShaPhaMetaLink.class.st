Class {
	#name : #TypShaPhaMetaLink,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaMetaLink class >> shadowedClass [
	^ MetaLink class
]

{ #category : #shadow }
TypShaPhaMetaLink >> mArguments: aLookup [ 
	<typShaMethod: 'arguments:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {Symbol typAsType} ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaMetaLink >> mControl: aLookup [ 
	<typShaMethod: 'control:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaMetaLink >> mMetaObject: aLookup [ 
	<typShaMethod: 'metaObject:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			Object typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaMetaLink >> mSelector: aLookup [ 
	<typShaMethod: 'selector:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Symbol typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
