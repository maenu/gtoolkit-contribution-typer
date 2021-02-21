Class {
	#name : #TypShaBrBrTextEditor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextEditor class >> shadowedClass [
	^ BrTextEditor class
]

{ #category : #shadow }
TypShaBrBrTextEditor >> mInvalidateTo: aLookup [ 
	<typShaMethod: 'invalidate:to:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaBrBrTextEditor >> mText: aLookup [ 
	<typShaMethod: 'text'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlText typAsType ];
		yourself
]

{ #category : #shadow }
TypShaBrBrTextEditor >> mUpdateTo: aLookup [ 
	<typShaMethod: 'update:to:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
