Class {
	#name : #TypShaPhaCompilationContext,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaCompilationContext class >> shadowedClass [
	^ CompilationContext class
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mBindings: aLookup [ 
	<typShaMethod: 'bindings:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Dictionary typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mClass: aLookup [ 
	<typShaMethod: 'class:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | ClassDescription typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mForSyntaxHighlighting: aLookup [ 
	<typShaMethod: 'forSyntaxHighlighting:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Boolean typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaCompilationContext >> mRequestor: aLookup [ 
	<typShaMethod: 'requestor:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Object typAsType asNullable ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
