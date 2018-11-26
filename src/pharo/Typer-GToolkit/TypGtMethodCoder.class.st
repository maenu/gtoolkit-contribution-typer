Class {
	#name : #TypGtMethodCoder,
	#superclass : #GtMethodCoder,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtMethodCoder >> addOns [
	^ addOns
]

{ #category : #'instance creation' }
TypGtMethodCoder >> newCompletionStrategy [
	| completionStrategy ast |
	completionStrategy := TypGtPharoCompletionStrategy new.
	completionStrategy classOrMetaClass: self classOrMetaClass.
	[ ast := GtPharoParser parseWithErrors: self patternSource.
	completionStrategy methodPattern: ast pattern ]
		on: Error
		do: [ :ex | ex return ].
	^ completionStrategy
]
