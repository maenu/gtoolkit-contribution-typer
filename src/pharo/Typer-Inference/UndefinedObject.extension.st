Extension { #name : #UndefinedObject }

{ #category : #'*Typer-Inference' }
UndefinedObject class >> typInfAbstractInterpretIfNil: aMessageNode [
	<typInfAbstractInterpret: #ifNil:>
	^ TypInfInlineContext
		sender: aMessageNode context
		state: aMessageNode state copy
		node: (self >> #ifNil:) ast
		self: aMessageNode context self asNonNullable
		super: aMessageNode context super asNonNullable
		message: aMessageNode
]

{ #category : #'*Typer-Inference' }
UndefinedObject class >> typInfAbstractInterpretIfNilIfNotNil: aMessageNode [
	<typInfAbstractInterpret: #ifNil:ifNotNil:>
	^ TypInfInlineContext
		sender: aMessageNode context
		state: aMessageNode state copy
		node: (self >> #ifNil:) ast
		self: aMessageNode context self asNonNullable
		super: aMessageNode context super asNonNullable
		message: aMessageNode
]

{ #category : #'*Typer-Inference' }
UndefinedObject class >> typInfAbstractInterpretIfNotNil: aMessageNode [
	<typInfAbstractInterpret: #ifNotNil:>
	| block |
	block := aMessageNode arguments first outAt: #typInfNode.
	^ TypInfBlockContext
		sender: aMessageNode context
		state: aMessageNode state copy
		node: block node
		self: block context self asNonNullable
		super: block context super asNonNullable
		message: aMessageNode
		block: block
]

{ #category : #'*Typer-Inference' }
UndefinedObject class >> typInfAbstractInterpretIfNotNilIfNil: aMessageNode [
	<typInfAbstractInterpret: #ifNotNil:ifNil:>
	| block |
	block := aMessageNode arguments first outAt: #typInfNode.
	^ TypInfBlockContext
		sender: aMessageNode context
		state: aMessageNode state copy
		node: block node
		self: block context self asNonNullable
		super: block context super asNonNullable
		message: aMessageNode
		block: block
]

{ #category : #'*Typer-Inference' }
UndefinedObject class >> typInfCanAbstractInterpretIfNil: aMessageNode [
	<typInfCanAbstractInterpret: #ifNil:>
	^ aMessageNode arguments
		allSatisfy: [ :e | 
			e
				outAt: #typInfNode
				ifPresent: [ :n | true ]
				ifAbsent: [ false ] ]
]

{ #category : #'*Typer-Inference' }
UndefinedObject class >> typInfCanAbstractInterpretIfNilIfNotNil: aMessageNode [
	<typInfCanAbstractInterpret: #ifNil:ifNotNil:>
	^ aMessageNode arguments
		allSatisfy: [ :e | 
			e
				outAt: #typInfNode
				ifPresent: [ :n | true ]
				ifAbsent: [ false ] ]
]

{ #category : #'*Typer-Inference' }
UndefinedObject class >> typInfCanAbstractInterpretIfNotNil: aMessageNode [
	<typInfCanAbstractInterpret: #ifNotNil:>
	^ aMessageNode arguments
		allSatisfy: [ :e | 
			e
				outAt: #typInfNode
				ifPresent: [ :n | true ]
				ifAbsent: [ false ] ]
]

{ #category : #'*Typer-Inference' }
UndefinedObject class >> typInfCanAbstractInterpretIfNotNilIfNil: aMessageNode [
	<typInfCanAbstractInterpret: #ifNotNil:ifNil:>
	^ aMessageNode arguments
		allSatisfy: [ :e | 
			e
				outAt: #typInfNode
				ifPresent: [ :n | true ]
				ifAbsent: [ false ] ]
]
