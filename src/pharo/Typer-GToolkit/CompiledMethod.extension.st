Extension { #name : #CompiledMethod }

{ #category : #'*Typer-GToolkit' }
CompiledMethod >> typGtSourceFor: aView [
	<gtView>
	^ aView explicit
		title: 'Source (coverage)' translated;
		priority: 1;
		actionStencil: [ BrButton new
				look: BrGlamorousButtonExteriorRectangularLook + BrGlamorousButtonIconLook;
				icon: BrGlamorousIcons browse asElement;
				action: [ self browse ] ];
		stencil: [ | coder |
			coder := GtMethodCoder forMethod: self.
			coder expanded: true.
			coder addOns addPatternStyler: TypGtPatternStyler new.
			coder addOns addBodyStyler: TypGtBodyStyler new.
			coder asElement ]
]
