Extension { #name : #CompiledMethod }

{ #category : #'*Typer-GToolkit' }
CompiledMethod >> typGtSourceFor: aView [
	<gtView>
	^ aView explicit
		title: 'Source (Typer)' translated;
		priority: 1;
		actionStencil: [ BrButton new
				look: BrGlamorousButtonExteriorRectangularLook + BrGlamorousButtonIconLook;
				icon: BrGlamorousIcons browse asElement;
				action: [ self browse ] ];
		stencil: [ | coder |
			coder := TypGtMethodCoder forMethod: self.
			coder expanded: true.
			coder addOns addPatternStyler: TypGtPatternStyler new.
			coder addOns addBodyStyler: TypGtBodyStyler new.
			coder asElement ]
]
