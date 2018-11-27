Extension { #name : #String }

{ #category : #'*Typer' }
String >> typAsType [
	| clazz i |
	i := self indexOf: $< ifAbsent: [ self size ].
	clazz := self copyFrom: 1 to: i.
	^ i < self size
		ifTrue: [ | parameters |
			parameters := ($, split: (self copyFrom: i + 1)) collect: #typAsType.
			TypParametricType new
				type: clazz typAsType;
				parameters: parameters;
				yourself ]
		ifFalse: [ TypClassType new
				clazz: clazz asSymbol;
				yourself ]
]
