Class {
	#name : #TypShaGtGtPhlowProtoView,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPhlowProtoView class >> shadowedClass [
	^ GtPhlowProtoView class
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mExplicit: aLookup [ 
	<typShaMethod: 'explicit'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtPhlowExplicitView typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mMondrian: aLookup [ 
	<typShaMethod: 'mondrian'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | GtPhlowMondrianView typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mPriority: aLookup [ 
	<typShaMethod: 'priority:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtPhlowProtoView >> mTitle: aLookup [ 
	<typShaMethod: 'title:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
