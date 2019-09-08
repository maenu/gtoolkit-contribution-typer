Class {
	#name : #TypShaPhaCompilationContext,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaCompilationContext class >> shadowedClass [
	^ CompilationContext class
]

{ #category : #accessing }
TypShaPhaCompilationContext >> ___bindings: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Dictionary typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompilationContext >> ___class: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | ClassDescription typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompilationContext >> ___forSyntaxHighlighting: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Boolean typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaCompilationContext >> ___requestor: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | Object typAsType asNullableType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
