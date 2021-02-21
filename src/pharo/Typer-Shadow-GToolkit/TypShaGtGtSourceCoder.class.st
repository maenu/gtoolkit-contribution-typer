Class {
	#name : #TypShaGtGtSourceCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtSourceCoder class >> shadowedClass [
	^ GtSourceCoder class
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mClassOrMetaClass: aLookup [ 
	<typShaMethod: 'classOrMetaClass'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mCollapsedEditor: aLookup [ 
	<typShaMethod: 'collapsedEditor'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BrTextEditor typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mExpanded: aLookup [ 
	<typShaMethod: 'expanded:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Boolean typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mMethodsCoder: aLookup [ 
	<typShaMethod: 'methodsCoder:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtMethodsCoder typAsType ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mSource: aLookup [ 
	<typShaMethod: 'source'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
