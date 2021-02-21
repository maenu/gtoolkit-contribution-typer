Class {
	#name : #TypShaBlBlLayoutConstraints,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlLayoutConstraints class >> shadowedClass [
	^ BlLayoutConstraints class
]

{ #category : #shadow }
TypShaBlBlLayoutConstraints >> mHorizontal: aLookup [ 
	<typShaMethod: 'horizontal'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlLayoutConstraintsAxis typAsType ];
		yourself
]

{ #category : #shadow }
TypShaBlBlLayoutConstraints >> mVertical: aLookup [ 
	<typShaMethod: 'vertical'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlLayoutConstraintsAxis typAsType ];
		yourself
]
